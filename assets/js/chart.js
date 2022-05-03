let ChartHook = {
  mounted() {
    console.log("mounted", this.el);
  },
  // beforeUpdate() {
  //   console.log("beforeUpdate", this.el);
  // },
  updated() {
    // console.log("updated", this.el);
    let price = this.el.dataset.price,
      timestamp = parseInt(this.el.dataset.tradedAt),
      tradedAt = new Date(timestamp)

    console.log(tradedAt, price);
  },
  // destroyed() {
  //   console.log("destroyed", this.el);
  // },
  // disconnected() {
  //   console.log("disconnected", this.el);
  // },
  // reconnected() {
  //   console.log("reconnected", this.el);
  // }
}

export { ChartHook }
