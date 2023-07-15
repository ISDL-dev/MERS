import { BrowserRouter, Routes, Route } from "react-router-dom";
import { ChakraProvider } from '@chakra-ui/react'

import Header from "./features/Header";
import Footer from "./features/Footer";
import QuestionnarePage from "./routes/Questionnare";
import RatingPage from "./routes/MediaRating";

function App() {
  return (
    <ChakraProvider>
      <div className="App">
        <Header/>
        <BrowserRouter>
          <Routes>
            <Route path='/media_rating' element={<RatingPage mediaType="image"/>}/>
            <Route path='/questionnare' element={<QuestionnarePage />}/>
          </Routes>
        </BrowserRouter>
        <Footer/>
      </div>
    </ChakraProvider>
  );
}

export default App;
