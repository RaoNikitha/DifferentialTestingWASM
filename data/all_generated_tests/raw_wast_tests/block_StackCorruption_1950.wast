;; 1. **Incorrect Nesting Level Manipulation**: Construct a sequence of nested blocks where the innermost block pops more values off the stack than it pushes. Verify that stack underflow errors are accurately detected.

(assert_invalid
 (module (func $incorrect-nesting-level
   (block (result i32)
     (block (result i32)
       (i32.const 1)
       (block (result i32)
         (br 1)
         (i64.const 2)
       )
       (i32.add)
     )
   )
 ))
 "stack underflow"
)