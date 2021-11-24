<script>
import { Bar } from "vue-chartjs";
import { mapState } from "vuex";
const companyStore = "companyStore";
const houseStore = "houseStore";

export default {
  extends: Bar,
  props: {
    chartData: [],
  },
  computed: {
    ...mapState(houseStore, ["interests"]),
    ...mapState(companyStore, ["company"]),
  },
  data() {
    return {
      dongs: [],
      prices: [],
      datacollection: {
        //Data to be represented on x-axis
        labels: [],
        datasets: [
          {
            label: "단위 : 만원",
            backgroundColor: "#86B1E5",
            pointBackgroundColor: "white",
            borderWidth: 1,
            pointBorderColor: "#249EBF",
            //Data to be represented on y-axis
            data: [],
          },
        ],
      },
      //Chart.js options that controls the appearance of the chart
      options: {
        scales: {
          yAxes: [
            {
              ticks: {
                beginAtZero: true,
              },
              gridLines: {
                display: true,
              },
            },
          ],
          xAxes: [
            {
              gridLines: {
                display: false,
              },
            },
          ],
        },
        legend: {
          display: true,
        },
        responsive: true,
        maintainAspectRatio: false,
      },
    };
  },
  mounted() {
    // console.log("chart", this.interests);
    // console.log("0", this.interests[0].dongname);
    this.datacollection.labels[0] = "확인";
    for (let index = 0; index < this.interests.length; index++) {
      //   // console.log(this.interests[index].dongname);

      this.datacollection.labels[index] = this.interests[index].dongname;
      //   this.datacollection.options.data[index] = 5;
      this.datacollection.datasets[0].data[index] =
        this.interests[index].avgPrice;
    }
    console.log("datacollection", this.datacollection);
    //renderChart function renders the chart with the datacollection and options object.
    this.renderChart(this.datacollection, this.options);
  },
};
</script>
<style scoped></style>
