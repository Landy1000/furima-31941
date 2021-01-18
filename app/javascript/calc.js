function calc (){ 
  const priceField = document.getElementById("item-price"); 

    const price = priceField.value
    const fee = Math.round( price * 0.1 )
    const profit = price - fee

    const feeField = document.getElementById('add-tax-price'); 
    feeField.innerHTML = `${fee}`
    
    const profitField = document.getElementById('profit'); 
    profitField.innerHTML = `${profit}`
} 

setInterval(calc, 1000); 