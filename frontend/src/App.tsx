import React from 'react';
import axios from "axios";
import logo from './logo.svg';
import './App.css';
import Data from './test.json';

function App() {
  const onClick = () => {
    axios.post('http://localhost:3000/trials', Data)
  .then(function (response) {
    console.log(response);
    alert("success");
  })
  .catch(function (error) {
    console.log(error);
    alert("failure");
  });

  }
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.tsx</code> and save to reload
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
        <button type="submit" onClick={onClick}>Add</button>
      </header>
    </div>
  );
}

export default App;
