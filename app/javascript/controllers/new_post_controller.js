import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    connect() {
        // console.log("Connected");
        // const messages = document.getElementById("messages");
        // posts.addEventListener("DOMNodeInserted", this.resetScroll)
        // this.resetScroll(messages)  
        const posts = document.querySelectorAll(".posts")        
        const comments = document.querySelectorAll(".comment-user-id-field")
        const uid = document.cookie.slice(4)
        
        posts.forEach((post) => post.addEventListener("DOMNodeInserted", () => {comments.forEach(comment => comment.value = uid)}))
        // comments.forEach(comment => comment.value = uid)
    }
    
    disconnect() {
        console.log("Disconnected")
    }
    
    updateUserId() {
        const uid = document.cookie.slice(4)
        const comments = document.querySelectorAll(".comment-user-id-field")
        comments.forEach(comment => comment.value = uid)
    }
}