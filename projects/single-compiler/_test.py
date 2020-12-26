def test_only_cxx_compiler_set():
    import os

    project_abspath = os.path.dirname(os.path.abspath(__file__))
    build_dir_base = os.environ['BUILD_DIR_BASE']

    cache_file_abspath = os.path.join(project_abspath, build_dir_base, 'CMakeCache.txt')

    assert os.path.isfile(cache_file_abspath)

    import re
    compiler_line_regex = re.compile(r'^CMAKE_.*_COMPILER:.*')

    compilers = [line
        for line in open(cache_file_abspath)
        if re.match(compiler_line_regex, line)]

    assert len(compilers) == 1
    assert compilers[0].startswith('CMAKE_CXX_COMPILER')
