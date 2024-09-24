;; 3. Test an infinite loop where `br_if` branches to an outer loop, but with complex stack manipulations before the branch. If `wizard_engine` doesn't track state correctly, it might keep running indefinitely.

(assert_invalid
  (module
    (func $complex-stack-manipulation-infinite-loop
      (block $outer
        (loop $inner
          (i32.const 1)    ;; Push value
          (i32.const 1)    ;; Push condition for br_if
          (br_if $outer)   ;; Conditional branch to outer loop
          (drop)           ;; Drop value to keep the stack balanced
          (br $inner)      ;; Unconditional loop back to inner
        )
      )
    )
  )
  "type mismatch"
)