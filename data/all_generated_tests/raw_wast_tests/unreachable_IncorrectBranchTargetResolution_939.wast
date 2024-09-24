;; Create an intricate combination of `blocks`, `loops`, and `if` statements. Purposefully assign incorrect branch targets to `br` instructions inside these control flow constructs. Place `unreachable` instructions immediately after these branch resolutions to ensure misinterpretations in branch targeting are caught and handled appropriately in differential environment comparisons.

(assert_invalid
  (module
    (func $test
      (block $outer
        (block $inner
          (br 1) ; jump to $outer
          (unreachable)
        )
        (unreachable)
      )
      (loop $infinite
        (block $exit
          (br 2) ; incorrect jump to $outer, should contain $exit
          (unreachable)
        )
        (br 0)
      )
      (if (i32.const 1) 
        (then
          (br 2) ; incorrect jump target outside loop and block context
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)