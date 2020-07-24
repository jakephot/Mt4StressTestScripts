// ✓ KEEP THIS LINE TO ENSURE THAT THIS FILE IS SAVED IN UNICODE ✓
#property show_inputs

input int TargetCount = 100;
input int Cmd = OP_BUY;
input double Lots = 0.01;
input int Magic = 0;

void start() {
   double price;
   int totalAttempts = 0;
   int ticket;

   for(int i=0; i<TargetCount; i++) {
      if (totalAttempts > 10000) {
         Print("Too many attempts.");
         break;
      }

      switch(Cmd) {
         case OP_BUY: price = MarketInfo(Symbol(), MODE_ASK); break;
         case OP_SELL: price = MarketInfo(Symbol(), MODE_BID); break;
      }

      ticket = OrderSend(Symbol(), Cmd, Lots, price, 0, 0, 0, "", Magic);

      if(ticket > 0) {
         OrderSelect(ticket, SELECT_BY_TICKET);
         OrderClose(ticket, OrderLots(), OrderClosePrice(), 0, CLR_NONE);
         Sleep(100);
      } else {
         i--;
      }
      totalAttempts++;
   }
}
