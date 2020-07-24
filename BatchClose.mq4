// ✓ KEEP THIS LINE TO ENSURE THAT THIS FILE IS SAVED IN UNICODE ✓あああ
#property show_inputs

input string OnlySymbol = "";

void start() {
   for(int i=0; i < OrdersTotal(); i++){
      if(OrderSelect(0, SELECT_BY_POS, MODE_TRADES) == false) break;
      if(OnlySymbol != "" && OrderSymbol() != OnlySymbol) continue;
 
      if(OrderClose(OrderTicket(), OrderLots(), OrderClosePrice(), 0, CLR_NONE)) {
         i--;
      }
      Sleep(100);
   }
}