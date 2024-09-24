;; Test 1: Create a test with deeply nested `block` instructions and use `br_if` to conditionally break out of each block. Verify if the stack height and values remain consistent after each conditional branch.

(assert_invalid
 (module (func $test
  (block $L0 (result i32)
   (block $L1 (result i32)
    (block $L2 (result i32)
     (block $L3 (result i32)
      (block $L4 (result i32)
       (br_if 4 (i32.const 1) (i32.const 10))
      )
      (i32.const 20)
     )
     (i32.const 30)
    )
    (i32.const 40)
   )
   (i32.const 50)
  )
  (drop)
 ))
 "type mismatch"
)