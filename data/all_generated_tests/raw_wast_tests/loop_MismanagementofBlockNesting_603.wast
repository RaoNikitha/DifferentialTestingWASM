;; 4. Structure a `loop` within a `loop`, both containing backward `br` instructions that target different depths, with break conditions relying on stack operations. Test whether stack unwinding and branch targeting are consistent and correctly managed across different depths.

(assert_invalid
  (module
    (func
      (block (loop (loop (br 1))) (i32.const 1) (br_if 0)
    )
  )
  "type mismatch"
)