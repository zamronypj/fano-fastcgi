(*!------------------------------------------------------------
 * [[APP_NAME]] ([[APP_URL]])
 *
 * @link      [[APP_REPOSITORY_URL]]
 * @copyright Copyright (c) [[COPYRIGHT_YEAR]] [[COPYRIGHT_HOLDER]]
 * @license   [[LICENSE_URL]] ([[LICENSE]])
 *------------------------------------------------------------- *)
unit HomeViewFactory;

interface

uses
    fano;

type

    (*!-----------------------------------------------
     * Factory for view THomeView
     *
     * @author [[AUTHOR_NAME]] <[[AUTHOR_EMAIL]]>
     *------------------------------------------------*)
    THomeViewFactory = class(TFactory)
    public
        function build(const container : IDependencyContainer) : IDependency; override;
    end;

implementation

uses

    SysUtils,

    {*! -------------------------------
        unit interfaces
    ----------------------------------- *}
    StringFileReaderImpl,
    HomeView;

    function THomeViewFactory.build(const container : IDependencyContainer) : IDependency;
    var fileReader : IFileReader;
    begin
        fileReader := TStringFileReader.create();
        result := THomeView.create(
            fileReader.readFile(getCurrentDir() + '/src/Templates/Home/index.html')
        );
    end;
end.
