import React, { useEffect, useState } from 'react'
import Nav from './Nav'
import MenuButton from './MenuButton';
import { useNavigate } from 'react-router-dom';

const Header = () => {
  const [menuToggle, setMenuToggle] = useState(false);
  const [scrollY, setScrollY] = useState(0);
  const [isSticky, setIsSticky] = useState(false);
  const [lastScrollY, setLastScrolly] = useState(0);
  const navigate = useNavigate()

  //menu Toggle function (used by menuButton and nav_links)
  const handleMenu = () => {
    setMenuToggle(!menuToggle);
  }


  // if screen width < 769 and menu is open , this function closes the menu (see useEffect)
  const handleResizeScreen = () => {
    if (window.scrollY > 769) {
      setMenuToggle(false)
    }
  }
 

    //resize event
    useEffect(() => {
   
      window.addEventListener("resize", handleResizeScreen)

      return () => {
        window.removeEventListener("resize", handleResizeScreen)
      
      }
    }, [])
  
  function returnToHome() {
    navigate('/')
  }

 

    return (
      <div className={'header_outer'} style={isSticky && menuToggle === false ? { position: "sticky" } : { position: "relative" }}>
    
        <header>
          <div className={"brand_logo"} onClick={()=>returnToHome()}>
            <img src={"/images/brand-logo.png"} alt={"Garage Vincent Parrot"} />
          </div>
  
          <Nav menuToggle={menuToggle ? menuToggle : null} handleMenu={handleMenu} />
          <MenuButton className={`menu_button ${menuToggle ? "menu_button--open " : ""} `} onClick={handleMenu} />
        </header>
      </div>
    )
  }


export default Header
