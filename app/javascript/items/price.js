function price (){

  const itemPrice = document.getElementById("item-price")
  const addTaxPrice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")

  let itemPriceValue = itemPrice.value
  let addTaxPriceValue = Math.floor(itemPriceValue*0.1)
  let profitValue = Math.floor(itemPriceValue - addTaxPriceValue)
  addTaxPrice.innerHTML = addTaxPriceValue
  profit.innerHTML = profitValue
  
  itemPrice.addEventListener('input',function(){
    let itemPriceValue = itemPrice.value
    let addTaxPriceValue = Math.floor(itemPriceValue*0.1)
    let profitValue = Math.floor(itemPriceValue - addTaxPriceValue)
    addTaxPrice.innerHTML = addTaxPriceValue
    profit.innerHTML = profitValue
  })
}

window.addEventListener('load', price)