#!/data/miniconda3/envs/env1/bin/python
import sys
import hickle
from filelock import FileLock

envfile = '/data/picasso/envlist.hkl'
lockfile = envfile + '.lock'

def main():
    args = sys.argv[1:]
    lock = FileLock(lockfile)

    with lock:
        if len(args) == 2:
            # Create the list: envlist.py cenv 64
            prefix = args[0]
            n = int(args[1])
            envs = [f"{prefix}{i}" for i in range(n)]
            hickle.dump(envs, envfile)
        elif len(args) == 0:
            # Pop and return the first environment
            envs = hickle.load(envfile)
            envs = list(envs)
            env = envs.pop(0)
            hickle.dump(envs, envfile)
            print(env)
        elif len(args) == 1:
            # Return an environment to the list
            envname = args[0]
            envs = hickle.load(envfile)
            envs = list(envs)
            envs.append(envname)
            hickle.dump(envs, envfile)
        else:
            print("Usage: envlist.py [prefix count] | [envname] | (no args)")
            sys.exit(1)

if __name__ == '__main__':
    main()
