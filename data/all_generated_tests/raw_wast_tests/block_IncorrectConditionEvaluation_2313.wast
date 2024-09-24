;; 4. Test branching to an outer `block` from a nested `block` using `br_if`, with the condition influenced by stack operations (e.g., `push` and `popE`), ensuring the correct branching behavior and type integrity.

(assert_invalid
  (module (func $branching-outer-block-nested (result i32)
    (block (result i32)
      (block
        (i32.const 1)
        (br_if 1 (i32.const 0)) ;; Should branch to outer block but condition is false
        (br 0 (i32.const 42)) ;; Will branch to the same block
      )
      (i32.const 2) ;; Executed if no branch was taken
    )
  ))
  "type mismatch"
)