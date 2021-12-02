<script>
import { Line } from "vue-chartjs";
import { mapState } from "vuex";
const houseStore = "houseStore";
export default {
  extends: Line,
  computed: {
    ...mapState(houseStore, ["interests"]),
  },
  watch: {
    interests: function () {
      this.updatechart();
    },
  },
  data() {
    return {
      datacollection: {
        //Data to be represented on x-axis
        labels: [],
        datasets: [
          {
            label: "단위 : 만원",
            backgroundColor: "#f87979",
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
      set.forEach((item) => {
        this.datacollection.labels.push(item);
      });
      set1.forEach((item) => {
        this.datacollection.datasets.data.push(item);
      });
      this.datacollection.datasets[0].data = this.datacollection.datasets.data;
      this.renderChart(this.datacollection, this.options);
    },
  },
};
</script>
