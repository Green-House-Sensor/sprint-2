const themeToggler = document.querySelector(".theme-toggler");

themeToggler.addEventListener('click', () => {
    document.body.classList.toggle('dark-theme-variables');

    themeToggler.querySelector('span:nth-child(1)').classList.toggle('active');
    themeToggler.querySelector('span:nth-child(2)').classList.toggle('active');
})

Orders.forEach(order => {
    const tr = document.createElement('tr');
    const trContent = `
    
                            <td>${order.sensor}</td>
                            <td>${order.numero}</td>
                            <td>${order.localizacao}</td>
                            <td class="${order.status === 'Declined' ? 'danger' : order.status === 'pending' ? 'warning' : 'primary'}">${order.status}</td>
                            <td class="primary">Detalhes</td>
                        
    `;
    tr.innerHTML = trContent;
    document.querySelector('table tbody').appendChild(tr);
})