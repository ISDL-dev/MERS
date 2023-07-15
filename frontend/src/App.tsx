import { BrowserRouter, Routes, Route } from "react-router-dom";
import { ChakraProvider } from '@chakra-ui/react'

import Header from "./features/Header";
import Footer from "./features/Footer";
import Questionnare from "./routes/Questionnare";
import Home from "./routes/Home";

function App() {
  return (
    <ChakraProvider>
      <div className="App">
        <Header/>
        <BrowserRouter>
          <Routes>
          <Route path='/' element={<Home />}/>
            <Route path='/questionnare' element={<Questionnare />}/>
          </Routes>
        </BrowserRouter>
        <Footer/>
      </div>
    </ChakraProvider>
  );
}

export default App;
