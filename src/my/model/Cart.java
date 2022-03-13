package my.model;


	public class Cart{
		private int pid;
		private int amount;
		
		public Cart() {}

		public Cart(int pid, int amount) {
			super();
			this.pid = pid;
			this.amount = amount;
		}

		public int getPid() {
			return pid;
		}

		public void setPid(int pid) {
			this.pid = pid;
		}

		public int getAmount() {
			return amount;
		}

		public void setAmount(int amount) {
			this.amount = amount;
		}
		
		

}
