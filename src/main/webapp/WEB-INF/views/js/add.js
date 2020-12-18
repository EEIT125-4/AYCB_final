var isShow = false;

function addshow() {
    if (!isShow) {
        isShow = true;
        document.getElementById('add').style.display = 'block';
    } else {
        isShow = false;
        document.getElementById('add').style.display = 'none';
    }
}
