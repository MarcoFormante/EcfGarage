import React from 'react'
import PropTypes from 'prop-types'
import ButtonCta from '../Buttons/ButtonCta'



const CarCard = ({ id, make, model, thumbnail, km, year, offer, price,currentPage,lastlocation}) => {

  const handleSubject = (subject) => {
    sessionStorage.setItem("carSubject", subject)
  }


 
  return (
      <figure className='car_card'>
      <img src={"/images/uploads/" + thumbnail} alt={"Garage Vincent Parrot ," + make + " " + model} />

      <figcaption className={"car_card_model"}>{make} {model}</figcaption>
                <div className={'car_card_details'}>
        
                {/*card_details_left*/}
        
                <div className={'car_card_details--left'}>
                    <span className={'car_card_details--left_km'}>{km} km</span>
                    <span className={'car_card_details--left_year'}>Année: {year}</span>
                </div>
        
                  {/*card_details_right (price)*/}
        
                  <div className={'car_card_details--right'}>
                      {offer && offer > 0
                        ?
                          <span className={'car_card_details_offer_price'}>{price - offer} $</span>
                        :
                          ""
                      }
                      <span className={"car_card_details_price"} style={offer > 0 ?{textDecoration:"line-through"}:{}}>{price} $</span>
                </div>
              </div>{}
                  {/*Buttons: Contacter, Details  (Links to pages)*/} 
      
              <div className={'car_card_buttons'}>
        <ButtonCta className={"car_card_cta cta--white"} inner={"Détails"} type={"carCard"} to={"/parc-auto/details/" + id} state={{ id, make, thumbnail, model, year, km, price, offer, currentPage, lastlocation }} />
        <ButtonCta className={"car_card_cta cta--red"} style={{border:"none"}}  inner="Contacter" onClick={() => handleSubject(model)} type="link" to={"/contact"} state={{make,model,id,year}} />

              </div>
                 
      </figure>
    
  )
}

export default CarCard

CarCard.propTypes = {
    id: PropTypes.number.isRequired,
    thumbnail:PropTypes.string.isRequired,
    model: PropTypes.string.isRequired,
    km: PropTypes.number.isRequired,
    year: PropTypes.number.isRequired,
    offer: PropTypes.number.isRequired,
    price: PropTypes.number.isRequired
}
