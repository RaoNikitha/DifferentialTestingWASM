;; 7. **Test 7**: Construct a `block` that includes a `br` instruction leading to another `block`, which in turn calls a function with a complex return type to evaluate the control flow accuracy and stack correction.

(assert_invalid
  (module (func $test7
    (block (result i32)
      (block 
        (br 1 (i32.const 42))
        (block (result i32) 
          (call $complex_function) 
          (i32.const 0)))
      (i32.add))
  ))
  "type mismatch"
)