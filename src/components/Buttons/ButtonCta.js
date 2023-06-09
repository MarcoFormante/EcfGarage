import React from 'react'
import { Link } from 'react-router-dom'

const ButtonCta = ({ state,type,inner,to,...rest}) => {
    
    if (type === "button") {
        return (
                <button {...rest}>{inner}</button>
        )
    } else if(type ==="link"){
      return (
        <button {...rest}><Link to={to} state={{...state}} >{inner}</Link></button>
      )
    }
 
}

export default ButtonCta
