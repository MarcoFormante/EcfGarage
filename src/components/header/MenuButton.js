import React from 'react'

const MenuButton = ({className,onClick}) => {
  return (
    <div className={className} onClick={onClick} role='button'>
          <span></span>
          <span></span>
          <span></span>
    </div>
  )
}

export default MenuButton
