import React, { useEffect, useState } from 'react'
import axios from '../../../../api/axios'
import PageTitle from '../../../PageTitle/PageTitle'
import { AvisCard } from '../../Home/AvisSection'
import toast, { Toaster } from 'react-hot-toast';
import Loading from '../../../Loading/Loading';
import SwitchPageBlock from '../../../SwitchPageBlock/SwitchPageBlock';

const ReviewsHandler = () => {
    const [avis,setAvis]=useState([])
    const [filters, setFilters] = useState(0);
    const [loading, setLoading] = useState(false)
    const [currentPage,setCurrentPage] = useState(0)
  
    const notifySuccess = (text) => toast.success(text);
    const notifyError = (text) => toast.error(text);


    
    useEffect(() => {
        setLoading(true)
        const homepagePath = process.env.REACT_APP_HTTP + `pages/admin/reviewHandler.php?currentPage=${currentPage * 9}&filter=${filters}`;
            axios.get(homepagePath)
                .then(response => {
                    console.log(response.data);
                if (response.data.status === 1) {
                    let reviews = [];
                    response.data.reviews.forEach((review,index)=> {
                            reviews.push(response.data.reviews[index])
                    });
                    setAvis([...reviews])

                    setTimeout(() => {
                        setLoading(false)
                    }, 500);
                }
                

            })
    }, [filters,currentPage])




    
    function toggleReviewValidation(avisId, av) {
        let newValidationNumber = +!av.is_validate;
        const formData = new FormData();
        formData.append("reviewValidationValue", newValidationNumber);
        formData.append("reviewValidationId", avisId);
        axios.post("pages/admin/reviewHandler.php", formData, {

            headers: {
                    "Content-Type": "application/www-x-urlencodeform"
            }
        }
        ).then(response => {
            if (response.status === 200 && response.data.status === 1) {
                setAvis([...avis], av.is_validate = av.is_validate === 0 ? 1 : 0);
                notifySuccess("Modifié avec succès");
            } else {
                notifyError("Un erreur est survenu, rententez.")
            }
        })
      
    }
    

    return (
      
        <div>
            <Toaster />
            <Loading isLoading={loading}/>
            <PageTitle pageTitle={"Gestion des avis "} />
           
            <div className='container--pad-top ' >
                <div className='mar-top-20 mar-bot-50'>
                    <p className='text-center'>Dans cette page vous pouvez <span className='c-red text-bold'>Moderer</span> ou <span className='c-green text-bold'>Valider</span> les Avis</p>
                </div>
                <div className='input_center_handler'>
                    <div className='container--center--column inputs_container_filters_inner '>
                        <label htmlFor="gestionReviewFilters">Filtrer par</label>
                        <select type="text" id='gestionReviewFilters' onChange={(e)=> setFilters(e.target.value)}>
                            <option value="0">A' valider</option>
                            <option value="1">Tout</option>
                        </select>
                    </div>      
                </div>
            </div>
                
            <div className='list-flex-wrap container--pad-bottom gap-50' style={{padding:50}}>
                {
                    filters === "1" 
                        ?
                        avis.map((av, index) =>
                            <div key={`avis_ADM${av.id}`}>
                                <div style={av.is_validate ? { backgroundColor: "red", color: "white" } : { backgroundColor: "lightgreen", color: "black" }}
                                    onClick={() => toggleReviewValidation(av.id, av)}
                                    className='reviewValidatorSwitch'>{av.is_validate ? "Moderer" : "Valider"}
                                </div> <AvisCard key={"avis_" + index + "_card"}
                                    name={av.name}
                                    message={av.message}
                                    review={av.review}
                                    style={av.is_validate === 1 ? { border: "2px solid lightgreen" } : { border: "2px solid red" }}
                                />
                            </div>
                        )                        
                        : 
                        avis.map((av, index) => {
                            return av.is_validate === 0 &&
                                <div key={`avis_ADM${av.id}`}>
                                    <div style={av.is_validate ? { backgroundColor: "red", color: "white" } : { backgroundColor: "lightgreen", color: "black" }}
                                        onClick={() => toggleReviewValidation(av.id, av)}
                                        className='reviewValidatorSwitch'>{av.is_validate ? "Moderer" : "Valider"}
                                    </div> <AvisCard key={"avis_" + index + "_card"}
                                        name={av.name}
                                        message={av.message}
                                        review={av.review}
                                        style={av.is_validate === 1 ? { border: "2px solid lightgreen" } : { border: "2px solid red" }}
                                    />
                                </div>
                        })
                           
                }
               
            </div>
            <SwitchPageBlock handleCarPage={()=>{} } currentPage={currentPage} setCurrentPage={(value)=>setCurrentPage(value)} dataLength={avis[0]?.count} />
    </div>
     
  )
}

export default ReviewsHandler
