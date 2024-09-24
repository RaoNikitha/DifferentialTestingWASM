;; 4. Place `unreachable` within the `then` branch of an `if-else` statement inside a loop, ensuring the `else` branch executes correctly when the loop conditions are valid.    - **Constraint:** Assure that `unreachable` does not interfere with conditionals and subsequent loop iterations.    - **CFG Check:** Validate correct branching and loop continuation despite `unreachable` in conditional branches.

(assert_invalid
  (module
    (func $loop-unreachable-in-if (param $x i32) (result i32)
      (local $i i32)
      (local.set $i (i32.const 0))
      (loop
        (if (local.get $x)
          (then (unreachable))
          (else (local.set $i (i32.add (local.get $i) (i32.const 1))))
        )
        (br_if 0 (local.get $x))
      )
      (local.get $i)
    )
  )
  "type mismatch"
)