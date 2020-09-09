function price(){
   const price = document.getElementById("item-price");
   const tax = document.getElementById("add-tax-price");
   const profit = document.getElementById("profit");
   
     price.addEventListener('keyup', () => {
         const value = price.value; 
         
       if (value >= 300 && value <= 9999999){
         let fee = Math.floor(value * 0.1)/1;
         let gains = value - fee;
         tax.textContent = fee;
         profit.textContent = gains;
     } else {
       let fee = '-';
       let gains = '-';
       tax.textContent = fee;
       profit.textContent = gains;
     }
   });
  
  }
  window.addEventListener('load', price);