/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

function loadComments(endpoint) {
    fetch(endpoint).then(function (res) {
        return res.json();
    }).then(function (data) {
        let c = document.getElementById("comments");
        let h = '';
        for (let d of data)
            h += `
            
                                    <div class="card-body">
                                        <p>${d.content}</p>
                                        <i>${moment(d.ngayTao).locale("vi").fromNow()}</i>
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex flex-row align-items-center">
                                                <img src="${d.user.avatar}" alt="avatar" width="25" height="25" />
                                                <p class="small mb-0 ms-2">${d.user.username}</p>
                                            </div>
                                           
                                        </div>
                                    </div>
                                       
`;
        c.innerHTML = h;
    });
}

function addComment(endpoint, proId) {
    fetch(endpoint, {
        method: "post",
        body: JSON.stringify({
            "content": document.getElementById("contentId").value,
            "sanPhamId": proId
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
//        location.reload()
        let d = document.querySelector("#comments div:first-child");
        let h = `
                
                                    <div class="card-body">
                                        <p>${data.content}</p>
                                        <i>${moment(data.ngayTao).locale("vi").fromNow()}</i>
                                        <div class="d-flex justify-content-between">
                                            <div class="d-flex flex-row align-items-center">
                                                <img src="${data.user.avatar}" alt="avatar" width="25" height="25" />
                                                <p class="small mb-0 ms-2">${data.user.username}</p>
                                            </div>
                                           
                                        </div>
                                    </div>
                                
            `;
        d.insertAdjacentHTML("beforebegin", h);
        
    });
}

function addToCart(id, ten, gia) {
    event.preventDefault();
    fetch("/ShopWeb/api/cart", {
        method: 'post',
        body: JSON.stringify({
            "sanPhamId": id,
            "tenSanPham": ten,
            "donGia": gia,
            "soLuong": 1
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        let counter = document.getElementById("cartCounter");
        counter.innerText = data;
    });
}

function updateCart( obj, sanPhamId) {
    fetch("/ShopWeb/api/cart", {
        method: "put",
        body: JSON.stringify({
            "sanPhamId": sanPhamId,
            "tenSanPham": "",
            "donGia": 0,
            "soLuong": obj.value
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then(function (res) {
        return res.json();
    }).then(function (data) {
        let counter = document.getElementById("cartCounter");
        counter.innerText = data.counter
        let amount = document.getElementById("amountCart");
        amount.innerText = data.amount;
        location.reload()
    });
}

function deleteCart(sanPhamId) {
    if (confirm("Bạn chắc chắn muốn xóa sản phẩm này không?") == true) {
        fetch(`/ShopWeb/api/cart/${sanPhamId}`, {
            method: "delete"
        }).then(function (res) {
            return res.json();
        }).then(function (data) {
            let counter = document.getElementById("cartCounter");
            counter.innerText = data.counter
            let amount = document.getElementById("amountCart");
            amount.innerText = data.amount;
            location.reload()
        });
    }
}

function pay() {
    if (confirm("Bạn muốn thanh toán?") == true){
        fetch("/ShopWeb/api/pay", {
            method: 'post'
        }).then(function (res) {
            return res.json();
        }).then(function (code) {
        console.info(code);
        location.reload();
        })
    }
}

