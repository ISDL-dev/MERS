import axios from "axios";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import Header from "./features/Header";
import Footer from "./features/Footer";
import Rating from "./routes/Rating";
import SubjectInfo from "./routes/SubjectInfo";

function App() {
  return (
    <div className="App">
      <Header/>
      <BrowserRouter>
        <Routes>
          <Route path='/rating' element={<Rating />}/>
          <Route path='/subject_info' element={<SubjectInfo />}/>
        </Routes>
      </BrowserRouter>
      <Footer/>
    </div>
  );
}

export default App;
