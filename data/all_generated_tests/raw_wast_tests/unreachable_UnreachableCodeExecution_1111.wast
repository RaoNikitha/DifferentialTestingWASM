;; 2. Construct a nested loop where an inner loop contains an `unreachable` instruction inside a conditional block that depends on the loop index. Test whether the trap occurs only when the condition is met.

(assert_invalid
  (module
    (func (param i32)
      (loop
        (block (br_if 1 (i32.eqz (local.get 0))))
        (loop
          (br_if 1 (i32.eq (i32.const 0) (local.tee 0 (i32.sub (local.get 0) (i32.const 1)))))
          (if (i32.eqz (local.get 0))
            (then
              (unreachable))
          ))
      ))
  )
  "type mismatch"
)