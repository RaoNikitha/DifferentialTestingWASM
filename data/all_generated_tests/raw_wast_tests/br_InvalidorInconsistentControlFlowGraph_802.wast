;; 3. **Incorrect Loop Return Handling Test:**    Create a `loop` containing a `br` that branches to the beginning of the loop. Follow it with a block that should only execute if the loop exits after a certain number of iterations, testing if the implementation handles loop termination correctly.

(assert_invalid
  (module
    (func $incorrect-loop-return
      (local i32)
      (loop
        (local.set 0 (i32.add (local.get 0) (i32.const 1)))
        (br_if 0 (i32.lt_s (local.get 0) (i32.const 10)))
      )
      (block (local.set 0 (i32.const 20)))
    )
  )
  "type mismatch"
)