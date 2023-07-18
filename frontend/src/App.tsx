import { BrowserRouter, Routes, Route } from "react-router-dom";
import { ChakraProvider } from '@chakra-ui/react'

import Header from "./features/Header";
import Footer from "./features/Footer";
import QuestionnarePage from "./routes/Questionnare";
import RatingPage from "./routes/MediaRating";
import PreRating from "./routes/PreRating";
import Completion from "./routes/Completion";

function App() {
  return (
    <ChakraProvider>
      <div className="App">
        <Header/>
        <BrowserRouter>
          <Routes>
            <Route path='/media_rating' element={<RatingPage mediaType="image"/>}/>
            <Route path='/questionnare' element={<QuestionnarePage />}/>
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
