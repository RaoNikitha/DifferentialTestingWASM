;; 3. Use a nested `block` within another `block`, with the inner block concluding with `unreachable`. The outer block expects an `i32` input. Examine if the type expectation of the outer block is correctly enforced despite the inner block causing a trap.

(assert_invalid
  (module (func $type-nested-unreachable-block
    (block (result i32) (block (unreachable)) (i32.const 1))
  ))
  "type mismatch"
)