;; Nest a block within a function that recursively calls itself. Export this function and import it into another module. Inside the block, perform a forward branch (`br`) to test if the stack state is consistent after the branch and function return. Compare the operand stack's state at the return point to ensure type adherence.

(assert_invalid
  (module
    (func $recurse (result i32)
      (block (result i32)
        (br 0 (call 0)))) 
    (export "recurse" (func $recurse))
  )
  "type mismatch"
)