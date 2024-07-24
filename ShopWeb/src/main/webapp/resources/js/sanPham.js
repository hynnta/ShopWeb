/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function delProduct(endpoint, id) {
    let d = document.getElementById("load" + id);
    d.style.display = "block";
    fetch(endpoint, {
        method: "delete"
    }).then(function (res) {
        if (res.status === 204)
            location.reload();
    }).catch(function (err) {
        console.error(err);
    });
}

function getSanPham(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let d = document.getElementById("adminSanPham");
        if (d !== null) {
            let h = "";
            for (let i = 0; i < data.length; i++)
                h += `
                <tr id="row${data[i].id}">
                    <td>${data[i].id}</td>
                    <td><img src="${data[i].hinhAnh}" width='120' /></td>
                    <td>${data[i].ten}</td>
                    <td >${data[i].gia} VNĐ</td>
                    <td>${data[i].ghiChu}</td>
                    
                    <td>
                    <div class="spinner-border text-secondary" style="display:none" id="load${data[i].id}"></div>
                    <button class='btn btn-danger' onclick="delProduct('${endpoint + "/" + data[i].id}', ${data[i].id})">Xóa</button>
                </td>
                    
                </tr>
            `
            d.innerHTML = h;

        }
        let d2 = document.getElementById("loading");
        d2.style.display = "none";
    }).catch(function (err) {
        console.error(err);
        
    })
}
