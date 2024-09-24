;; Create a loop with an invalid `blocktype` specification and ensure that the CFG validation correctly rejects this loop in both implementations.

(assert_invalid 
  (module 
    (func $invalid-loop-blocktype 
      (loop (block (param i32) (drop)))
    )
  ) 
  "type mismatch"
)