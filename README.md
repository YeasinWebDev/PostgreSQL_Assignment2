1. What is PostgreSQL?
=> Postgre হলো একটি ওপেন সোর্স অবজেক্ট রিলেশনাল ডেটাবেজ।
  রিলেশনের হওয়ার কারণে খুব সহজে ডেটা স্টোর করা যায় এবং বের করা যায়।
  এর পারফরমেন্স এবং flexibility জন্য  বড় বড় প্রজেক্টে ব্যবহার করা হয়

2.Explain the Primary Key and Foreign Key concepts in PostgreSQL?
=> primary key : এটি  একটি টেবিলের row গুলোকে ইউনিক ভাবে আইডেন্টিফাই করার জন্য ব্যবহার করা হয় | এটি NULL হতে পারে না
   foreign key :  প্রাইমারি কি যখন অন্য একটি টেবিলে গিয়ে ওই টেবিলের সাথে  সম্পর্ক স্থাপন করে তখন
   এক টেবিলে প্রাইমারি কি অন্য টেবিলে ফরেন কি হয় | এটি দুটি টেবিলের মধ্যে সম্পর্ক স্থাপনা ব্যবহার করা হয়

3.Explain the purpose of the WHERE clause in a SELECT statement?
=> যখন কোনো ডেটা আমরা একটি নির্দিষ্ট শর্তের উপর ভিত্তি করে দেখতে চাই তখন where clause ব্যবহার করা হয়।  এটি SELECT, 
   UPDATE, DELETE — এই তিন ধরনের SQL statement-এ ব্যবহৃত হতে পারে।
    যেমন : 
    select * from students  where age > 18 ; 
    এখানে আমরা সেই students দেকতে পাবো যাদের বয়স ১৮ বেশি

4.What are the LIMIT and OFFSET clauses used for?
=> limit আর offset আমরা সাধারণত pagination  সময় ব্যবহার করে থাকি।  
  যেখানে limit মানে বোঝায় কয়টা আউটপুট দেখানো হবে ।  আর offset মানে 
  শুরুতে কতগুলি ডেটা বাদ দিয়ে দেখাবে।
   যেমন :
   select * from student offset 10 limit 5
   মানে প্রথম দশটা বাদ দিয়ে পরবর্তী পাঁচটা ডেটা দেখানো হবে

5.What is the significance of the JOIN operation, and how does it work in PostgreSQL?
=> join সাধারণত দুটি টেবিলের মধ্যে যুক্ত করে কিছু তথ্য বের করে আনার জন্য ব্যবহার করা হয়। 
  একাধিক টেবিলে যেটা যুক্ত করতে পারে এর ফলে ডেটার ডুপ্লিকেট হওয়ার সম্মান কমে যায়। 
  এর জন্য দুটি টেবিলে অবশ্যই একটি সংযোগকারী ফিল থাকতে হয়। join অনেক ধরনের হতে পারে। 
    যেমন: 
    inner join,  left join,  right join,  full join,  cross join.
