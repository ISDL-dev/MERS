import { BrowserRouter, Routes, Route } from "react-router-dom";
import { ChakraProvider } from '@chakra-ui/react'

import Header from "./features/Header";
import Footer from "./features/Footer";
import Questionnare from "./routes/Questionnare";
import Home from "./routes/Home";
import PreRating from "./routes/PreRating";
import Completion from "./routes/Completion";

function App() {
  return (
    <ChakraProvider>
      <div className="App">
        <Header/>
        <BrowserRouter>
          <Routes>
          <Route path='/' element={<Home />}/>
            <Route path='/questionnare' element={<Questionnare />}/>
            <Route path='/prerating' element={<PreRating />}/>
            <Route path='/completion' element={<Completion />}/>
          </Routes>
        </BrowserRouter>
        <Footer/>
      </div>
    </ChakraProvider>
  );
}

export default App;
