;; 3. Craft a module that uses a mix of conditional (`if-then-else`) structures with nested loops, where each branch of the condition has a `call_indirect`. Ensure consistent depth handling and function signature matching regardless of the conditional path taken.

(assert_invalid
  (module
    (type $sig (func (param i32)))
    (table 1 funcref)
    (func $f (param i32))
    (elem (i32.const 0) $f)
    (func (param i32)
      (local.get 0)
      (if
        (then
          (loop
            (call_indirect (type $sig) (i32.const 1))
            br 1
          )
        )
        (else
          (loop
            (call_indirect (type $sig) (i32.const 1))
            br 1
          )
        )
      )
    )
  )
  "index out of allowed range"
)