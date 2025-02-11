import React, { useEffect, useState } from 'react';
import { Bar } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';
import './barChart.css';

ChartJS.register(
  CategoryScale,
  LinearScale,
  BarElement,
  Title,
  Tooltip,
  Legend
);

const BarChart = () => {
  const [chartData, setChartData] = useState({ labels: [], datasets: [] });

  // Fetch data from API
  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch('http://localhost:3001/ps_skill');
        const data = await response.json();

        // Prepare data for the chart
        const labels = data.map(item => item.l_name);
        const points = data.map(item => item.points);

        setChartData({
          labels: labels,
          datasets: [
            {
              label: 'Fullstack Rank Points',
              data: points,
              backgroundColor: 'rgba(54, 162, 235, 0.5)',
              borderColor: 'rgba(54, 162, 235, 1)',
              borderWidth: 1,
            },
          ],
        });
      } catch (error) {
        console.error('Error fetching data:', error);
      }
    };

    fetchData();
  }, []); 

  
  const options = {
    responsive: true,
    plugins: {
      legend: {
        position: 'top',
        labels: {
          font: {
            size: 18, 
          },
          color: '#e9ecf1', 
        },
      },
      title: {
        display: true,
        text: 'Fullstack Rank Points Chart',
        font: {
          size: 24, 
        },
        color: '#ffffff', 
      },
    },
    scales: {
      y: {
        beginAtZero: true,
        max: 100,
        ticks: {
          font: {
            size: 14, 
          },
          color: '#e9ecf1', 
        },
      },
      x: {
        ticks: {
          font: {
            size: 14, 
          },
          color: '#e9ecf1', 
        },
      },
    },
  };

  return (
    <div className="chart-container">
      <Bar data={chartData} options={options} />
    </div>
  );
};

export default BarChart;
