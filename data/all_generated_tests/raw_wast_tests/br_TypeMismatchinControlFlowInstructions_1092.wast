;; 3. A `loop` that requires an `i32` for its iteration but receives an `f64` instead when performing a backward `br` to the start of the loop. This tests type enforcement within loop instructions.

(assert_invalid
  (module
    (func $type-loop-mismatch
      (block
        (loop (param i32)
          (f64.const 0.0)
          (br 0)
        )
      )
      (i32.eqz) (drop)
    )
  )
  "type mismatch"
)