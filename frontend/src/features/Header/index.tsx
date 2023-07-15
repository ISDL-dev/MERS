import "./Header.css"

function Header() {
    return (
        <nav className="nav">
            <ul>
                <li><a href="/">Home</a></li>
                <li><a href="/questionnare">Rating</a></li>
                {/* <li><a href="/result">Result</a></li>
                <li><a href="/admin">Admin</a></li> */}
            </ul>
        </nav>
    )
}

export default Header
