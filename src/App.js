import React,{useCallback, useEffect, useState} from 'react'
import Header from './components/header/Header';
import Home from './components/pages/Home/Home';
import TimeOpeningBlock from './components/pages/Home/TimeOpeningBlock';
import Footer from './components/Footer/Footer';
import ParcAuto from './components/pages/ParcAuto/ParcAuto';
import { Routes, Route, useLocation, Navigate,Outlet} from 'react-router-dom';
import CarDetails from './components/pages/ParcAuto/CarDetails';
import Contact from './components/pages/Contact/Contact';
import ReservedArea from './components/pages/ReservedArea/ReservedArea';
import AdminNav from './components/AdminNav/AdminNav';
import { useSelector,useDispatch } from 'react-redux';
import CheckToken from './helpers/CheckToken';
import { add,remove } from './components/Reducers/RoleReducer';
import AvisPage from './components/pages/avisPage/AvisPage';
import NewCarPage from './components/pages/admin/NewCar/NewCarPage';
import Accounts from './components/pages/admin/Accounts/Accounts';



function App() {

  const role = (useSelector((state) => state.role.value))
  const [login, setlogin] = useState(false)
  const location = useLocation()
  const [hidden,setHidden] = useState([])
  
  

  useEffect(() => {
    setHidden(["admin","area-reserve"].filter(path => location.pathname.includes(path)))
  }, [location.pathname])
  

 
 
  return (
    <div className="App">

      {/*public*/}
      
      <Header />
      <AdminNav role={role}  />
      <Routes>
        <Route exact path='/' element={<Home />} />
        <Route path='/parc-auto' element={<ParcAuto />} />
        <Route path='/parc-auto/details/:id' element={<CarDetails />} />
        <Route path="/contact" element={<Contact/>} />
        <Route path="/area-reserve" element={<ReservedArea setLogin={(value) => setlogin(value)} />} />
        <Route path="/avis" element={<AvisPage/>} />
        <Route path='*' element={"NOT FOUND 404"} />
    
        {/*Protected*/}
        
        <Route element={<ProtectedRoute auth={window.localStorage.getItem("token")}
          login={login} redirectPath={"/"} />}
        >
          <Route path={"/admin/new-car"} element={<NewCarPage/>} />
          <Route path={"/admin/modify-car"} element={<h1>adminpage</h1>} />
          <Route path={"/admin/services"} element={<h1>adminpage</h1>} />
          <Route path={"/admin/accounts"} element={<Accounts/>} />
          <Route path={"/admin/feedback"} element={<h1>adminpage</h1>} />
          <Route path={"/admin/time-table"} element={<h1>adminpage</h1>} />
          <Route path={"/admin/*"} element={<h1>notfound</h1>} />
        </Route>
        
      </Routes>
      {
        !hidden[0] &&
        <div>
          <TimeOpeningBlock />
          <Footer />
        </div>
      }
      
    </div>
  );
}

export default App;

const ProtectedRoute = ({ auth, redirectPath,login}) => {

  const location = useLocation();


  const dispatch = useDispatch()
 
  const check = useCallback(
    () => {
      if (localStorage.getItem("token")) {
        console.log("ecccolo");
          CheckToken(localStorage.getItem("token")).then((response) => {
           let isValid = response.data.status;
           if (isValid === 1) {
               const userRole = response.data.role; 
                dispatch(add(userRole))
    
           } else {
              dispatch(remove())
             
           }
       })
      } else {
        dispatch(remove())
      }
    },
    [login],
  )

  
  function checkStorage() {
   
    
  }
  
  useEffect(() => {
     window.addEventListener("storage",check())
    
    return window.removeEventListener("storage",check())
    
},[login])

return auth
      ?
  <div>
     <Outlet />
      </div>
      :
      <Navigate to={redirectPath} replace state={{from: location} } />
}
