<script>
import { Bar } from "vue-chartjs";
import { mapState } from "vuex";
import http from "@/util/http-common";
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
      ranking: [],
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
    http.get(`/map/interest/popular/${this.company.bCode}`).then(({ data }) => {
      this.ranking.push(data);
    });
    this.updatechart();
  },
  methods: {
    updatechart() {
      var set = new Set();
      var set1 = new Set();
      this.datacollection.labels = [];
      this.datacollection.datasets.data = [];
      console.log("결과다임마: ", this.ranking[0]);
      this.ranking.forEach((item) => {
        console.log(item[0]);
        set.add(item.aptname);
        set1.add(item.popularity);
      });
      // console.log(set);
      // set.forEach((item) => {
      //   this.datacollection.labels.push(item);
      // });
      // set1.forEach((item) => {
      //   this.datacollection.datasets.data.push(item);
      // });
      // this.datacollection.datasets[0].data = this.datacollection.datasets.data;
      this.renderChart(this.datacollection, this.options);
    },
  },
};
</script>
