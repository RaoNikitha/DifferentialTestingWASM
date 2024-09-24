;; 1. Test a loop that includes a `br` instruction to force an immediate backward jump. Check for stack integrity before and after the branch, ensuring the loop reinitializes correctly without losing any essential stack data.

(assert_invalid
  (module (func $loop-reinitialize-stack-integrity (result i32)
    (local i32)
    (i32.const 10) ;; Initial value to test stack integrity
    (loop (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 5)) ;; Manipulate the stack value
      (local.tee 0) ;; Keep the result on the stack
      (br 0) ;; Jump back to the beginning of the loop
    )
  ))
  "improper loop stack manipulation"
)