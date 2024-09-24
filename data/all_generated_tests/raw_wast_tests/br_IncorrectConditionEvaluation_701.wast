;; 2. **Test Description 2:** Nest multiple structured controls (`block`, `if`, `loop`) and use a `br_if` within the loop conditioned on an equality check (`EQZ`) of a variable that changes within the loop. Incorrect condition evaluation may cause premature loop exits.    - **Constraint Checked:** Proper handling of equality condition evaluation inside nested constructs.    - **Differential Behavior:** Wizard Engine may incorrectly determine loop continuation.

(assert_invalid
  (module
    (func $nested-controls
      (local $x i32)
      (block
        (loop
          (if (i32.eqz (local.get $x))
            (br_if 1 (i32.const 1))
          )
          (local.set $x (i32.add (local.get $x) (i32.const 1)))
          (br 0)
        )
      )
    )
  )
  "unknown label"
)