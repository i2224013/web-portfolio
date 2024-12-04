function calculate() {
    const input1 = document.getElementById("input1").value;
    const input2 = document.getElementById("input2").value;

    fetch("/calculate", {
        method: "POST",
        headers: {
            "Content-Type": "application/json"
        },
        body: JSON.stringify({
            num1: input1,
            num2: input2
        })
    })
    .then(response => response.json())
    .then(data => {
        document.getElementById("result").innerText = "結果: " + data.result;
    })
    .catch(error => console.error("Error:", error));
}
