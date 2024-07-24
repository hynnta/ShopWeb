/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function generateColor() {
    let r = parseInt(Math.random()*255);
    let g = parseInt(Math.random()*255);
    let b = parseInt(Math.random()*255);
    return `rgb(${r}, ${g}, ${b})`
}

function danhMucChart(id, danhMucLabels=[], danhMucInfo=[]) {
    const data = {
        labels: danhMucLabels,
        datasets: [{
                label: 'Thống kê san phẩm theo danh mục',
                data: danhMucInfo,
                backgroundColor: [
                    'rgb(255, 99, 132)',
                    'rgb(54, 162, 235)',
                    'rgb(255, 205, 86)',
                    'rgb(60, 190, 125)'
                ],
                hoverOffset: 4
            }]
    };
    const config = {
        type: 'pie',
        data: data,
    };
    let ctx = document.getElementById(id).getContext("2d")
    new Chart(ctx, config)
}

function sanPhamChart (id, sanPhamLabels=[], sanPhamInfo=[]){
    let colors = []
    for (let i = 0; i < sanPhamInfo.length; i++)
        colors.push(generateColor())
    
    const data = {
        labels: sanPhamLabels,
        datasets: [{
                label: 'Thống kê doanh thu theo sản phẩm',
                data: sanPhamInfo,
                backgroundColor: colors,
                borderColor: colors,
                hoverOffset: 4
            }]
    };
    const config = {
        type: 'bar',
        data: data,
    };
    let ctx = document.getElementById(id).getContext("2d")
    new Chart(ctx, config)
}

function sanPhamThangChart (id, sanPhamThangLabels=[], sanPhamThangInfo=[]){
    let colors = []
    for (let i = 0; i < sanPhamThangInfo.length; i++)
        colors.push(generateColor())
    
    const data = {
        labels: sanPhamThangLabels,
        datasets: [{
                label: 'Thống kê doanh thu theo thời gian',
                data: sanPhamThangInfo,
                backgroundColor: colors,
                borderColor: colors,
                hoverOffset: 4
            }]
    };
    const config = {
        type: 'line',
        data: data,
    };
    let ctx = document.getElementById(id).getContext("2d")
    new Chart(ctx, config)
}