import React, { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import axios from '../../../api/axios'

const Services = () => {
  const [services,setServices]=useState([])
  
  useEffect(() => {
    //dev
    // const homepagePath = process.env.REACT_APP_HTTP + "pages/homePage.php?services=true";
    //prod
    
    const homepagePath = "pages/homePage.php?services=true";
    axios.get(homepagePath)
      .then(response => { setServices(response.data.services) })
      .catch(error=>console.warn(error.data.message))
},[])
  
 

  return (
    <div className={'section_page section_page_services'}>
        <h3 className={'section_title section_title_services'}>Découvrez nos services</h3> 
        <figure className={'container--flex container_services_first_block'}>
            <img src={"/images/services-image-garagevp.jpg"} alt="Reparation Voitures au Garage Vincent Parrot" width={530} height={447}/>
        <p className={'txt-services txt_services--lineheight'}>
            Dans notre centre,
            nous nous engageons à fournir des services
            de haute qualité pour vous assurer que votre véhicule
            roule dans les meilleures conditions.
            Du controle technique à la résolution de problèmes complexes,
            notre équipe possède l’expérience et les compétences nécessaires
            pour prendre soin de votre véhicule avec attention et précision.
          </p>
      </figure>
      
          <ul className={"services_list"}>
        {services && services.map((service,index)=> <li key={"service_"+index+service.length}>{service}</li>)}
          </ul>

      <p className={'txt_services txt_services_after_list mar-top-50'}>N’hésitez pas à nous <Link to={"/contact"}>contacter </Link>
         si vous souhaitez obtenir plus d’informations. Notre équipe se tient à votre disposition pour répondre
        à toutes vos questions et vous fournir les reinseignements dont vous avez besoin.</p>
        
    </div>
  )
}

export default Services
