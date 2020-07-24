// ✓ KEEP THIS LINE TO ENSURE THAT THIS FILE IS SAVED IN UNICODE ✓
#property show_inputs

input int TargetCount = 100;
input int Cmd = OP_BUY;
input double Lots = 0.01;
input int Magic = 0;

void start() {
   double price;
   int totalAttempts = 0;

   for(int i=0; i<TargetCount; i++) {
      if (totalAttempts > 10000) {
         Print("Too many attempts.");
         break;
      }

      switch(Cmd) {
         case OP_BUY: price = MarketInfo(Symbol(), MODE_ASK); break;
         case OP_SELL: price = MarketInfo(Symbol(), MODE_BID); break;
      }

      if(OrderSend(Symbol(), Cmd, Lots, price, 0, 0, 0, "", Magic) > 0) {
         Sleep(100);
      } else {
         i--;
      }
      totalAttempts++;
   }
}
