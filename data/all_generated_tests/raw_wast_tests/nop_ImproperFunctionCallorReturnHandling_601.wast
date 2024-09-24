;; 2. **Test 2**: Insert multiple `nop` instructions intermittently within a block of functions that make recursive `call` instructions to each other. Ensure that the recursion depth and return values remain correct, checking for any unintended influence from `nop`.

(assert_invalid
  (module 
    (func $recursive1 (result i32)
      (call $recursive2)
    )
    (func $recursive2 (result i32)
      (nop)
      (call $recursive1)
      (nop)
    )
  )
  "recursion depth or result value incorrect"
)