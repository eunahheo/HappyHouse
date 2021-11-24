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
  watch: {
    interests: function () {
      this.updatechart();
    },
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
  created() {
    this.updatechart();
  },
  methods: {
    updatechart() {
      var set = new Set();
      var set1 = new Set();
      this.datacollection.labels = [];
      this.datacollection.datasets.data = [];
      this.interests.forEach((item) => {
        set.add(item.dongname);
        set1.add(item.avgPrice);
      });
      console.log(set);
      set.forEach((item) => {
        this.datacollection.labels.push(item);
      });
      set1.forEach((item) => {
        this.datacollection.datasets.data.push(item);
      });
      this.datacollection.datasets[0].data = this.datacollection.datasets.data;
      // for (let index = 0; index < this.interests.length; index++) {
      //   //   // console.log(this.interests[index].dongname);

      //   this.datacollection.labels[index] = this.interests[index].dongname;
      //   //   this.datacollection.options.data[index] = 5;
      //   this.datacollection.datasets[0].data[index] =
      //     this.interests[index].avgPrice;
      // }
      console.log("datacollection", this.datacollection.datasets);
      //renderChart function renders the chart with the datacollection and options object.
      this.renderChart(this.datacollection, this.options);
    },
  },
};
</script>
<style scoped></style>
