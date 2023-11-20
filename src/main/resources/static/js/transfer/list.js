function del(transferNo, event){
    if(confirm("정말 삭제하시겠습니까?")){
        location.href = "./delete?transferNo=" + transferNo;
    }
    
    event.stopPropagation();
}